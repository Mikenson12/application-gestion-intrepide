import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsEmail, MinLength } from 'class-validator';

// DTO pour la connexion des utilisateurs
export class LoginDto {
  @ApiProperty({example: 'admin@gmail.com', description: 'Email de l\'utilisateur' })
  @IsEmail()
  @IsNotEmpty()
  readonly email: string;

  @ApiProperty({example: 'admin123', description: 'Mot de passe de l\'utilisateur' })
  @IsString()
  @IsNotEmpty()
  readonly password: string;
}

// DTO pour la réponse de l'authentification (facultatif)
export class AuthResponseDto {
  @ApiProperty({ description: 'YBFD&jk9nD12!R7sLx@5fZ#L$5n2Q6rY' })
  readonly accessToken: string;
}
