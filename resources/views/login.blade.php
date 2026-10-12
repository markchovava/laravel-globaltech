<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Notification</title>
</head>
<body style="margin: 0; padding: 0; background-color: #f1f5f9; font-family: Arial, san-serif;">

    {{-- Outer Wrapper --}}
    <div style="background-color: #f1f5f9; padding: 40px 20px;">

        {{-- Card Container --}}
        <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">

            {{-- Header --}}
            <div style="background-color: #1e40af; padding: 32px 40px; text-align: center;">
                <p style="margin: 0; color: #bfdbfe; font-size: 12px; letter-spacing: 2px; text-transform: uppercase;">Security Alert</p>
                <h1 style="margin: 8px 0 0; color: #ffffff; font-size: 24px; font-weight: 700;">Login Notification</h1>
            </div>

            {{-- Body --}}
            <div style="padding: 32px 40px;">

                {{-- Intro Text --}}
                <div style="margin-bottom: 24px;">
                    <p style="margin: 0; font-size: 15px; color: #334155; line-height: 1.7;">
                        A new login was detected on your website
                        <strong style="color: #1e40af;">{{ $appInfo->website }}</strong>.
                        If this was you or any of your team mamber, no action is needed.
                    </p>
                </div>

                {{-- Divider --}}
                <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 0 0 24px;" />

                {{-- Email Field --}}
                <div style="margin-bottom: 20px;">
                    <p style="margin: 0 0 4px; font-size: 11px; font-weight: 600; color: #1e40af; letter-spacing: 1.5px; text-transform: uppercase;">Email</p>
                    <p style="margin: 0; font-size: 15px; color: #334155;">{{ $data->email }}</p>
                </div>

                {{-- Date & Time Field --}}
                <div style="margin-bottom: 24px;">
                    <p style="margin: 0 0 4px; font-size: 11px; font-weight: 600; color: #1e40af; letter-spacing: 1.5px; text-transform: uppercase;">Date & Time</p>
                    <p style="margin: 0; font-size: 15px; color: #334155;">{{ now()->format('F j, Y \a\t g:i A') }}</p>
                </div>

                {{-- Alert Box --}}
                <div style="background-color: #eff6ff; border-left: 4px solid #1e40af; border-radius: 4px; padding: 16px 20px; margin-bottom: 24px;">
                    <p style="margin: 0; font-size: 14px; color: #1e40af; line-height: 1.6;">
                        If you did not perform this login, please secure your account immediately by changing your password.
                    </p>
                </div>

                {{-- Divider --}}
                <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 0 0 24px;" />

                {{-- Footer --}}
                <div style="text-align: center;">
                    <p style="margin: 0 0 4px; font-size: 11px; color: #94a3b8; text-transform: uppercase; letter-spacing: 1px;">Sent from</p>
                    <p style="margin: 0; font-size: 14px; font-weight: 600; color: #1e40af;">{{ $appInfo->website }}</p>
                </div>

            </div>{{-- End Body --}}

        </div>{{-- End Card Container --}}

    </div>{{-- End Outer Wrapper --}}

</body>
</html>