<?php

namespace App\Mail;

use App\Models\AppInfo;
use App\Models\Message;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class MessageMail extends Mailable
{
    use Queueable, SerializesModels;

    // ✅ Renamed from $message to $messageData to avoid conflict
    public $messageData;
    public $appInfo;

    public function __construct(Message $message, AppInfo $appInfo)
    {
        $this->messageData = $message;
        $this->appInfo = $appInfo;
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'MESSAGE NOTIFICATION FROM GLOBAL TECH WEBSITE',
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'message',
        );
    }

    public function attachments(): array
    {
        return [];
    }
}
