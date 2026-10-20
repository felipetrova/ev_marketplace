import { Controller, Get } from '@nestjs/common';
import { ChargingService } from './charging.service';
@Controller('charging')
export class ChargingController { constructor(private readonly service:ChargingService){} @Get('integration/status') integrationStatus(){ return this.service.integrationStatus(); } }
