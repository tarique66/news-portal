
import { Component } from '@angular/core';
import { HeaderComponent } from "./header/header.component";
import { FooterComponent } from "./footer/footer.component";
import { LoginComponent } from './login/login.component'; 
import { CommonModule } from '@angular/common'; 
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  standalone: true,
  imports: [HeaderComponent, FooterComponent, RouterModule,]
})
export class AppComponent {
  showLoginForm = false; 

  toggleLoginForm() {
     this.showLoginForm = !this.showLoginForm;
  }
}