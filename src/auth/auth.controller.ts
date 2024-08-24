import { Controller, Request, Post, UseGuards, Body } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBody, ApiResponse } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { LoginDto, AuthResponseDto } from './dto/auth.dto';
import { LocalAuthGuard } from './local-auth.guard';
import { JwtAuthGuard } from './jwt-auth.guard';

@ApiTags('auth')
@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post("login")
  @ApiOperation({ summary: 'Connexion de l\'utilisateur' })
  @ApiBody({type: LoginDto})
  @ApiResponse({ status: 201, description: 'Utilisateur connecté avec succès.' })
  @ApiResponse({ status: 401, description: 'Échec de l\'authentification.' })
  @UseGuards(LocalAuthGuard)
  async login(@Body() loginDto: LoginDto): Promise<AuthResponseDto> {
    return this.authService.login(loginDto);
  }

  // @ApiOperation({ summary: 'Enregistrement d\'un nouvel utilisateur' })
  // @ApiResponse({ status: 201, description: 'Utilisateur enregistré avec succès.' })
  // @ApiResponse({ status: 400, description: 'Mauvaise requête.' })
  // @ApiBody({ description: 'Données de l\'utilisateur', type: Object }) // Documente le corps de la requête
  // @Post('register')
  // async register(@Body() userDto: any) {
  //   return this.authService.register(userDto);
  // }
}
