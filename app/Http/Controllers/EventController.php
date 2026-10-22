<?php

namespace App\Http\Controllers;

use App\Http\Resources\EventResource;
use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;




class EventController extends Controller
{

    public function index()
    {
        $data = Event::with(['user', 'galleries'])
            ->orderBy('updated_at', 'desc')
            ->paginate(20);
        return EventResource::collection($data);
    }

    public function indexAll()
    {
        $data = Event::with(['user', 'galleries'])
            ->orderBy('updated_at', 'desc')
            ->get();
        return EventResource::collection($data);
    }

    public function search(Request $request)
    {
        $search = $request->input('search');
        $data = Event::with(['user', 'galleries'])
            ->where('title', 'like', "%{$search}%")
            ->orderBy('updated_at', 'desc')
            ->paginate(20)
            ->withQueryString();
        return EventResource::collection($data);
    }

    public function view(string|int $id)
    {
        $data = Event::with(['user', 'galleries'])->findOrFail($id);
        return new EventResource($data);
    }

    public function store(Request $request)
    {
        $data = new Event();
        $data->userId = Auth::id();
        $data->name = $request->input('name');
        $data->desc = $request->input('desc');
        $data->venue = $request->input('venue');
        $data->date = $request->input('date');
        $data->status = $request->input('status');
        $data->priority = $request->input('priority');
        $data->created_at = now();
        $data->updated_at = now();
        $data->save();
        return response()->json([
            'data' => new EventResource($data),
            'status' => 1,
            'message' => 'Event created successfully.',
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $data = Event::findOrFail($id);
        $data->userId = Auth::id();
        $data->name = $request->input('name');
        $data->desc = $request->input('desc');
        $data->venue = $request->input('venue');
        $data->date = $request->input('date');
        $data->status = $request->input('status');
        $data->priority = $request->input('priority');
        $data->updated_at = now();
        $data->save();
        return response()->json([
            'data' => new EventResource($data),
            'status' => 1,
            'message' => 'Event updated successfully.',
        ], 201);
    }

    public function delete($id)
    {
        $data = Event::findOrFail($id);
        $data->delete();
        return response()->json([
            'status' => 1,
            'message' => 'Event deleted successfully.',
        ], 200);
    }
}
