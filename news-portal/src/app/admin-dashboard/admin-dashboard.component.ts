import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ArticleService } from '../services/news.service'; 
import { AuthService } from '../services/auth.service'; 
import { Article } from '../models/news.interface'; 

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [RouterModule, FormsModule, CommonModule],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css']
})
export class AdminDashboardComponent implements OnInit {
  articles: Article[] = [];
  selectedArticle: Article | null = null;
  categories: any[] = [];

  @ViewChild('editForm') editForm!: ElementRef;

  constructor(private articleService: ArticleService, private authService: AuthService) {}

  ngOnInit(): void {
    this.loadArticles();
    this.loadCategories();
  }

  loadArticles(): void {
    this.articleService.getArticles().subscribe((data: Article[]) => {
      this.articles = data;
    });
  }

  loadCategories(): void {
    this.articleService.getCategories().subscribe((data: any[]) => {
      this.categories = data;
      console.log('Loaded categories:', this.categories);
    });
  }

  getCategoryName(categoryId: number): string {
    const category = this.categories.find(cat => cat.id === categoryId);
    return category ? category.name : 'Unknown';
  }

  selectArticle(article: Article): void {
    if (this.authService.isAdmin()) {
      this.selectedArticle = { ...article };
      setTimeout(() => {
        this.scrollToEditForm();
      }, 0);
    } else {
      alert('You do not have permission to edit articles.');
    }
  }

  createArticle(): void {
    if (this.authService.isAdmin()) {
      const newArticle: Article = {
        id: 0,
        title: '',
        content: '',
        author_id: 1, 
        category_id: 1,
        category_name: '', 
        image_url: '',
        publish_date: new Date(),
        created_at: new Date(),
        updated_at: new Date()
      };
      this.selectedArticle = newArticle;
      setTimeout(() => {
        this.scrollToEditForm();
      }, 0);
    } else {
      alert('You do not have permission to create articles.');
    }
  }

  saveArticle(): void {
    if (this.selectedArticle && this.authService.isAdmin()) {
      if (this.selectedArticle.id === 0) {
        this.articleService.createArticle(this.selectedArticle).subscribe(() => {
          this.loadArticles();
          this.selectedArticle = null;
        });
      } else {
        this.articleService.updateArticle(this.selectedArticle).subscribe(() => {
          this.loadArticles();
          this.selectedArticle = null;
        });
      }
    } else {
      alert('You do not have permission to save articles.');
    }
  }

  deleteArticle(id: number): void {
    if (this.authService.isAdmin()) {
      this.articleService.deleteArticle(id).subscribe(() => {
        this.loadArticles();
      });
    } else {
      alert('You do not have permission to delete articles.');
    }
  }

  scrollToEditForm(): void {
    this.editForm.nativeElement.scrollIntoView({ behavior: 'smooth' });
  }
}