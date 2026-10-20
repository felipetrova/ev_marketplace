import { Module } from '@nestjs/common';
import { HealthModule } from './modules/health/health.module';
import { ChargingModule } from './modules/charging/charging.module';
@Module({ imports: [HealthModule, ChargingModule] })
export class AppModule {}
