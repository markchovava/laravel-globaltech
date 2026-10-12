<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <style>
        body {
            font-family: sans-serif;
            color: #333;
            background-color: #f9fafb;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .header-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .card {
            background: #ffffff;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .grid {
            display: table;
            width: 100%;
        }

        .col {
            display: table-cell;
            width: 50%;
            vertical-align: top;
        }

        .record {
            margin-bottom: 12px;
            font-size: 14px;
        }

        .label {
            font-weight: 600;
            color: #666;
            width: 120px;
            display: inline-block;
        }

        .value {
            color: #111;
        }

        .status-sticker {
            background: #e5e7eb;
            padding: 4px 12px;
            border-radius: 9999px;
            font-size: 12px;
            text-transform: uppercase;
        }

        .total-price {
            font-weight: bold;
            color: #1d4ed8;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background-color: #d1d5db;
            text-align: left;
            padding: 8px;
            border: 1px solid #9ca3af;
            font-size: 14px;
        }

        td {
            padding: 8px;
            border: 1px solid #d1d5db;
            font-size: 14px;
        }

        .text-right {
            text-align: right;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1 class="header-title">Order Information</h1>

        <div class="card">
            <div class="grid">
                <div class="col">
                    <div class="record"><span class="label">Name:</span> <span class="value">{{ $data->customerName ?? 'Not Added' }}</span></div>
                    <div class="record"><span class="label">Email:</span> <span class="value">{{ $data->customerEmail ?? 'Not Added' }}</span></div>
                    <div class="record"><span class="label">Phone:</span> <span class="value">{{ $data->customerPhone ?? 'Not Added' }}</span></div>
                    <div class="record"><span class="label">Notes:</span> <span class="value">{{ $data->notes ?? 'Not Added' }}</span></div>
                </div>

                <div class="col">
                    <div class="record">
                        <span class="label">Status:</span>
                        <span class="status-sticker">{{ $data->status ?? 'Pending' }}</span>
                    </div>
                    <div class="record"><span class="label">Order No.:</span> <span class="value">{{ $data->orderRef ?? 'N/A' }}</span></div>
                    <div class="record"><span class="label">Date:</span> <span class="value">{{ $data->created_at ? $data->created_at->format('M d, Y') : 'N/A' }}</span></div>
                    <div class="record"><span class="label">Priority:</span> <span class="value">{{ ucfirst($data->priority ?? 'Normal') }}</span></div>
                    <div class="record">
                        <span class="label">Total Price:</span>
                        <span class="value total-price">${{ number_format($data->carPrice, 2) }}</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <h3 style="margin-top: 0;">Vehicle Details</h3>
            <table>
                <thead>
                    <tr>
                        <th style="width: 25%;">CAR ID</th>
                        <th style="width: 50%;">VEHICLE NAME</th>
                        <th style="width: 25%;" class="text-right">PRICE</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{{ $data->carId ?? 'N/A' }}</td>
                        <td>{{ $data->carName ?? 'Not Added' }}</td>
                        <td class="text-right">${{ number_format($data->carPrice, 2) }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>