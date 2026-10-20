import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

// Load backend/.env (the same file used by the Prisma CLI) when present.
const envFile = resolve(__dirname, '..', '.env');
if (existsSync(envFile)) process.loadEnvFile(envFile);

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix(process.env.API_PREFIX || 'api/v1');
  // Required for the Flutter Web build (Chrome) to call the API.
  app.enableCors();
  await app.listen(Number(process.env.PORT || 3000));
}
bootstrap();
