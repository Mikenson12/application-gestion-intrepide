import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from '../users/users.service';
// import { Users } from '../users/users.entity/users.entity';
// import { CreateUserDto } from '../users/dto/create-user.dto';
import * as bcrypt from 'bcryptjs';
import { AuthResponseDto, LoginDto } from './dto/auth.dto';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  async validateUser(email: string, pass: string): Promise<any> {
    const user = await this.usersService.findOneByEmail(email);
    if (user && (await bcrypt.compare(pass, user.password))) {
      const { password, ...result } = user;
      return result;
    }
    return null;
  }

  async login(loginDto: LoginDto): Promise<AuthResponseDto> {
    const user = await this.usersService.findOneByEmail(loginDto.email);

    const payload = { username: user.name, id: user.id };
    const accessToken = this.jwtService.sign(payload);

    return { accessToken };
  }

  // async register(createUserDto: CreateUserDto) {
  //   const hashedPassword = await bcrypt.hash(createUserDto.password, 10);
  //   const user = {
  //     ...createUserDto,
  //     password: hashedPassword,
  //   };
  //   return this.usersService.create(user);
  // }
}
