<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('attendances', function (Blueprint $table) {
    $table->id();

    $table->unsignedBigInteger('user_id');
    $table->unsignedBigInteger('shift_id');
    $table->unsignedBigInteger('location_id');

    $table->timestamp('scan_time');
    $table->string('status')->default('On-Time'); // On-Time / Late / Absent
    $table->string('photo_path')->nullable();
    $table->string('late_reason')->nullable();

    $table->timestamps();

    // Foreign keys
    $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
    $table->foreign('shift_id')->references('id')->on('shifts')->onDelete('cascade');
    $table->foreign('location_id')->references('id')->on('locations')->onDelete('cascade');
});
    }

    public function down(): void {
        Schema::dropIfExists('attendances');
    }
};
