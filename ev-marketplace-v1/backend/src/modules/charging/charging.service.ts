import { Injectable } from '@nestjs/common';
@Injectable()
export class ChargingService { integrationStatus(){ return { provider:'none', protocol:'OCPP', enabled:false, phase:'future', note:'MVP does not depend on OCPP.' }; } }
