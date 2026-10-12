<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * 
     * Run the migrations.
     * 
     *  
     */
    public function up(): void
    {
        Schema::create('inquiries', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('userId')->nullable();
            $table->bigInteger('serviceId')->nullable();
            $table->string('serviceName')->nullable();
            $table->string('customerName')->nullable();
            $table->string('customerPhone')->nullable();
            $table->string('customerAddress')->nullable();
            $table->string('customerEmail')->nullable();
            $table->text('message')->nullable();
            $table->string('status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inquiries');
    }
};
