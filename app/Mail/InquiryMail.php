<?php

namespace App\Mail;

use App\Models\AppInfo;
use App\Models\Inquiry;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class InquiryMail extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(
        public Inquiry $inquiry,
        public AppInfo $appInfo,
    ) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'INQUIRY NOTIFICATION FROM GLOBAL TECH WEBSITE',
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'inquiry',
        );
    }

    public function attachments(): array
    {
        return [];
    }
}
