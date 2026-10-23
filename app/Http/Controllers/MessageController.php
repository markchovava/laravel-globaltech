<?php

namespace App\Http\Controllers;

use App\Http\Resources\MessageResource;
use App\Mail\MessageMail;
use App\Models\AppInfo;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Throwable;

class MessageController extends Controller
{
    public function indexAll()
    {
        $data = Message::with(['user'])
            ->orderByDesc('updated_at')
            ->orderBy('email')
            ->get();
        return MessageResource::collection($data);
    }

    public function index()
    {
        $data = Message::with(['user'])
            ->orderByDesc('updated_at')
            ->orderBy('email')
            ->paginate(20);
        return MessageResource::collection($data);
    }

    public function search(Request $request)
    {
        if (!$request->filled('search')) {
            return $this->index();
        }
        $data = Message::with(['user'])
            ->where('email', 'LIKE', "%{$request->search}%")
            ->orderByDesc('updated_at')
            ->orderBy('email')
            ->paginate(20)
            ->withQueryString();
        return MessageResource::collection($data);
    }

    public function view(string|int $id)
    {
        $data = Message::with(['user'])->find($id);
        if (!$data) {
            return response()->json([
                'message' => 'Record does not exist.',
                'status' => 0,
                'data' => []
            ]);
        }
        return response()->json([
            'data' => new MessageResource($data),
            'status' => 1,
        ]);
    }

    public function store(Request $request)
    {
        // Check this first so we don't save a message we can't deliver
        $appInfo = AppInfo::first();
        if (!$appInfo || !$appInfo->email) {
            return response()->json([
                'message' => "You can't send message at the moment, kindly contact Admin.",
                'status' => 0,
            ]);
        }

        $data = Message::create([
            'name' => $request->name,
            'email' => $request->email,
            'title' => $request->title,
            'message' => $request->message,
            'status' => $request->status,
        ]);

        // Read from config (not env()), and drop empty values so a missing
        // ADMIN_EMAIL can never put a null recipient into Mail::to()
        $emails = array_values(array_filter(
            (array) config('mail.admin_emails', []),
            fn($email) => !empty($email)
        ));

        if (empty($emails)) {
            Log::warning('Message saved but no admin email is configured (ADMIN_EMAIL / ADMIN_EMAIL2).');
        } else {
            try {
                Mail::to($emails)->send(new MessageMail($data, $appInfo));
            } catch (Throwable $e) {
                // the message is already saved, so don't fail the visitor's request
                Log::error('Message email failed to send', ['error' => $e->getMessage()]);
            }
        }

        return response()->json([
            'message' => 'Message Sent successffully.',
            'status' => 1,
            'data' => new MessageResource($data),
        ]);
    }

    public function updateStatus($id, Request $request)
    {
        $userId = Auth::id();
        $data = Message::find($id);
        if (!$data) {
            return response()->json([
                'message' => 'Record not found.',
                'status' => 0,
            ]);
        }
        $data->status = $request->status;
        $data->userId = $userId;
        $data->save();
        return response()->json([
            'message' => 'Status updated successffully.',
            'status' => 1,
            'data' => new MessageResource($data),
        ]);
    }

    public function update($id, Request $request)
    {
        $userId = Auth::id();
        $data = Message::find($id);
        if (!$data) {
            return response()->json([
                'message' => 'Record not found.',
                'status' => 0,
            ]);
        }
        /* UPDATE */
        $data->update([
            'userId' => $userId,
            'email' => $request->email,
            'title' => $request->title,
            'message' => $request->message,
            'status' => $request->status,
        ]);
        return response()->json([
            'message' => 'Data saved succeffully.',
            'status' => 1,
            'data' => new MessageResource($data),
        ]);
    }

    public function delete(int|string $id)
    {
        $data = Message::find($id);
        if (!$data) {
            return response()->json([
                'message' => 'Record not found.',
                'status' => 0,
            ]);
        }
        $data->delete();
        return response()->json([
            'message' => 'Record deleted succeffully.',
            'status' => 1,
        ]);
    }
}
