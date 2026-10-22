<?php

namespace App\Http\Controllers;

use App\Http\Resources\InquiryResource;
use App\Mail\InquiryMail;
use App\Models\AppInfo;
use App\Models\Inquiry;
use App\Models\Service;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class InquiryController extends Controller
{
    /*
    inquiries are submitted by customers about a service.
    serviceName is stored alongside serviceId so the inquiry still
    reads correctly if the service is renamed or deleted later.
    userId is the logged-in user (if any) who created/owns the inquiry.
    */

    /** Fields a client may set. id, userId and timestamps are excluded. */
    private const FIELDS = [
        'serviceId',
        'serviceName',
        'customerName',
        'customerPhone',
        'customerAddress',
        'customerEmail',
        'message',
        'status',
    ];

    public function index()
    {
        $data = Inquiry::orderBy('created_at', 'desc')->paginate(20);
        return InquiryResource::collection($data);
    }

    /**
     * Search by customer details, service name or message.
     * Optional `status` filter: ?search=john&status=pending
     */
    public function search(Request $request)
    {
        $search = $request->input('search');
        $status = $request->input('status');

        $data = Inquiry::query()
            ->when($search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('customerName', 'like', "%{$search}%")
                        ->orWhere('customerEmail', 'like', "%{$search}%")
                        ->orWhere('customerPhone', 'like', "%{$search}%")
                        ->orWhere('serviceName', 'like', "%{$search}%")
                        ->orWhere('message', 'like', "%{$search}%");
                });
            })
            ->when($status, fn($query, $status) => $query->where('status', $status))
            ->orderBy('created_at', 'desc')
            ->paginate(20);

        return InquiryResource::collection($data);
    }

    public function indexAll()
    {
        $data = Inquiry::orderBy('created_at', 'desc')->get();
        return InquiryResource::collection($data);
    }

    public function view(string|int $id)
    {
        return new InquiryResource(Inquiry::findOrFail($id));
    }

    public function store(Request $request)
    {
        $data = $request->only(self::FIELDS);

        // fill in the service name from the service if it wasn't sent
        if (!empty($data['serviceId']) && empty($data['serviceName'])) {
            $data['serviceName'] = Service::find($data['serviceId'])?->name;
        }

        $inquiry = Inquiry::create($data);

        $appInfo = AppInfo::first();
        if (!$appInfo || !$appInfo->email) {
            return response()->json([
                'message' => "You can't send message at the moment, kindly contact Admin.",
                'status' => 0,
            ]);
        }
        $emails = [env('ADMIN_EMAIL'), env('ADMIN_EMAIL2')];
        Mail::to($emails)->send(new InquiryMail($inquiry, $appInfo));

        return response()->json([
            'data' => new InquiryResource($inquiry),
            'status' => 1,
            'message' => 'Inquiry created successfully.',
        ], 201);
    }

    public function updateStatus(string|int $id, Request $request)
    {
        $inquiry = Inquiry::findOrFail($id);
        $inquiry->status = $request->input('status');
        $inquiry->save();
        return response()->json([
            'data' => new InquiryResource($inquiry->fresh()),
            'status' => 1,
            'message' => 'Inquiry updated successfully.',
        ]);
    }

    /**
     * Partial update: only the fields present in the request are changed
     * (e.g. just `status` when an admin marks an inquiry as handled).
     */
    public function update(Request $request, string|int $id)
    {
        $inquiry = Inquiry::findOrFail($id);

        $inquiry->update($request->only(self::FIELDS));

        return response()->json([
            'data' => new InquiryResource($inquiry->fresh()),
            'status' => 1,
            'message' => 'Inquiry updated successfully.',
        ]);
    }

    public function delete(int|string $id): JsonResponse
    {
        Inquiry::findOrFail($id)->delete();

        return response()->json(['message' => 'Inquiry deleted successfully']);
    }
}
