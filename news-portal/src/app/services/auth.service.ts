import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { tap, catchError } from 'rxjs/operators';
import { Router } from '@angular/router';

interface LoginResponse {
  success: boolean;
  message: string;
  user?: {
    id: number;
    username: string;
    email: string;
    first_name: string;
    last_name: string;
    role: string;
    created_at: string;
  };
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost/news-portal/api/auth';
  private currentUserSubject: BehaviorSubject<any>;
  public currentUser: Observable<any>;

  constructor(private http: HttpClient, private router: Router) {
    this.currentUserSubject = new BehaviorSubject<any>(JSON.parse(localStorage.getItem('currentUser')!));
    this.currentUser = this.currentUserSubject.asObservable();
  }

  public get currentUserValue(): any {
    return this.currentUserSubject.value;
  }

  register(registrationData: { firstName: any; lastName: any; username: any; email: any; password: any; }): Observable<any> {
    console.log('Sending registration data:', registrationData);
    
    return this.http.post<any>(`${this.apiUrl}/register.php`, registrationData, {
        headers: new HttpHeaders({
            'Content-Type': 'application/json'
        })
    }).pipe(
        tap(response => console.log('Server response:', response)),
        catchError(error => {
            console.error('Full error details:', error);
            let errorMessage = 'Registration failed';
            
            if (error.error && error.error.message) {
                errorMessage = error.error.message;
            }
            
            return throwError(() => new Error(errorMessage));
        })
    );
  }

  login(username: string, password: string): Observable<LoginResponse> {
    console.log('Sending login request with:', { username, password });
    
    return this.http.post<LoginResponse>(`${this.apiUrl}/login.php`, { 
      username: username,
      password: password 
    }).pipe(
      tap(response => {
        console.log('Server response:', response);
        if (response.success && response.user) {
          localStorage.setItem('currentUser', JSON.stringify(response.user));
          this.currentUserSubject.next(response.user);
        }
      }),
      catchError(error => {
        console.error('Login error:', error);
        return throwError(() => error);
      })
    );
  }

  logout() {
    localStorage.removeItem('currentUser');
    this.currentUserSubject.next(null);
    this.router.navigate(['/login']);
  }

  isAdmin(): boolean {
    const currentUser = this.currentUserValue;
    return currentUser && currentUser.role === 'admin';
  }
}