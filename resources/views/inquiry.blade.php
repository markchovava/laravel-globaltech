<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NEW SERVICE INQUIRY</title>
</head>

<body style="margin: 0; padding: 0; background-color: #f1f5f9; font-family: Arial, sans-serif;">

    {{-- Outer Wrapper --}}
    <div style="background-color: #f1f5f9; padding: 40px 20px;">

        {{-- Card Container --}}
        <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">

            {{-- Header --}}
            <div style="background-color: #1d4ed8; padding: 32px 40px; text-align: center;">
                <p style="margin: 0; color: #bfdbfe; font-size: 12px; letter-spacing: 2px; text-transform: uppercase;">Notification</p>
                <h1 style="margin: 8px 0 0; color: #ffffff; font-size: 24px; font-weight: 700;">New Service Inquiry</h1>
            </div>

            {{-- Body --}}
            <div style="padding: 32px 40px;">

                {{-- Service Field --}}
                <div style="margin-bottom: 24px;">
                    <p style="margin: 0 0 4px; font-size: 11px; font-weight: 600; color: #1d4ed8; letter-spacing: 1.5px; text-transform: uppercase;">
                        Service</p>
                    <p style="margin: 0; font-size: 20px; font-weight: 700; color: #1e293b;">
                        {{ $inquiry->serviceName }}
                    </p>
                </div>

                {{-- Status Field --}}
                @if (!empty($inquiry->status))
                <div style="margin-bottom: 24px;">
                    <span style="display: inline-block; background-color: #eff6ff; color: #1d4ed8; font-size: 11px; font-weight: 600; letter-spacing: 1px; text-transform: uppercase; padding: 4px 12px; border-radius: 999px;">
                        {{ $inquiry->status }}
                    </span>
                </div>
                @endif

                {{-- Divider --}}
                <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 0 0 24px;" />

                {{-- Customer Name Field --}}
                <div style="margin-bottom: 24px;">
                    <p style="margin: 0 0 4px; font-size: 11px; font-weight: 600; color: #1d4ed8; letter-spacing: 1.5px; text-transform: uppercase;">
                        Customer Name</p>
                    <p style="margin: 0; font-size: 15px; color: #334155;">
                        {{ $inquiry->customerName }}
                    </p>
                </div>

                {{-- Email Field --}}
                <div style="margin-bottom: 24px;">
                    <p style="margin: 0 0 4px; font-size: 11px; font-weight: 600; color: #1d4ed8; letter-spacing: 1.5px; text-transform: uppercase;">
                        Email</p>
                    <p style="margin: 0; font-size: 15px; color: #334155;">
                        {{ $inquiry->customerEmail }}
                    </p>
                </div>

                {{-- Phone Field --}}
                <div style="margin-bottom: 24px;">
                    <p style="margin: 0 0 4px; font-size: 11px; font-weight: 600; color: #1d4ed8; letter-spacing: 1.5px; text-transform: uppercase;">
                        Phone</p>
                    <p style="margin: 0; font-size: 15px; color: #334155;">
                        {{ $inquiry->customerPhone }}
                    </p>
                </div>

                {{-- Address Field --}}
                @if (!empty($inquiry->customerAddress))
                <div style="margin-bottom: 24px;">
                    <p style="margin: 0 0 4px; font-size: 11px; font-weight: 600; color: #1d4ed8; letter-spacing: 1.5px; text-transform: uppercase;">
                        Address</p>
                    <p style="margin: 0; font-size: 15px; color: #334155;">
                        {{ $inquiry->customerAddress }}
                    </p>
                </div>
                @endif

                {{-- Message Field --}}
                <div style="margin-bottom: 24px;">
                    <p style="margin: 0 0 8px; font-size: 11px; font-weight: 600; color: #1d4ed8; letter-spacing: 1.5px; text-transform: uppercase;">
                        Message</p>
                    <div style="background-color: #eff6ff; border-left: 4px solid #1d4ed8; border-radius: 4px; padding: 16px 20px;">
                        <p style="margin: 0; font-size: 15px; color: #334155; line-height: 1.7;">
                            {!! nl2br(e($inquiry->message)) !!}</p>
                    </div>
                </div>

                {{-- Divider --}}
                <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 0 0 24px;" />

                {{-- Website Field --}}
                <div style="text-align: center;">
                    <p style="margin: 0 0 4px; font-size: 11px; color: #94a3b8; text-transform: uppercase; letter-spacing: 1px;">
                        Sent from</p>
                    <p style="margin: 0; font-size: 14px; font-weight: 600; color: #1d4ed8;">
                        {{ $appInfo->website }}
                    </p>
                </div>

            </div>{{-- End Body --}}

        </div>{{-- End Card Container --}}

    </div>{{-- End Outer Wrapper --}}

</body>

</html>