<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('reports', function (Blueprint $table) {
            $table->id();
            $table->foreignId('location_id')->nullable()->constrained()->onDelete('cascade');
            $table->enum('report_type', ['daily', 'weekly']);
            $table->string('file_url')->nullable();
            $table->dateTime('generated_at')->useCurrent();
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('reports');
    }
};
