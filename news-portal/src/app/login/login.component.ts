import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterModule
  ]
})
export class LoginComponent {
  loginForm: FormGroup;
  errorMessage: string = '';
  username: string = '';
  password: string = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.loginForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  onSubmit() {
    
    this.errorMessage = '';

    
    if (this.loginForm.get('username')?.value === '' || 
        this.loginForm.get('password')?.value === '') {
      this.errorMessage = 'Please fill in all fields';
      return;
    }

    if (this.loginForm.valid) {
      const { username, password } = this.loginForm.value;
      this.authService.login(username, password).subscribe({
        next: (response) => {
          if (response.success) {
            console.log('Login successful');
            
            localStorage.setItem('currentUser', JSON.stringify(response.user));
            
            
            this.router.navigate(['/news']);
          } else {
            this.errorMessage = response.message || 'Login failed';
          }
        },
        error: (error) => {
          console.error('Login error:', error);
          this.errorMessage = 'Unable to login. Please try again.';
        }
      });
    } else {
      this.errorMessage = 'Please enter valid credentials';
    }
  }
}
