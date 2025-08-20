<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('predictions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->enum('risk_level', ['low', 'medium', 'high']);
            $table->date('predicted_date');
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('predictions');
    }
};
