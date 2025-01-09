import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Article } from '../models/news.interface'; // Adjust the path as necessary

@Injectable({
  providedIn: 'root'
})
export class ArticleService {
  private apiUrl = 'http://localhost/news-portal/api/articles/articles.php'; // Combined endpoint
  private categoriesUrl = 'http://localhost/news-portal/api/articles/categories.php'; // Categories endpoint

  constructor(private http: HttpClient) {}

  getArticles(): Observable<Article[]> {
    return this.http.get<Article[]>(this.apiUrl);
  }

  getArticleById(id: number): Observable<Article> {
    return this.http.get<Article>(`${this.apiUrl}?id=${id}`);
  }

  createArticle(article: Article): Observable<any> {
    return this.http.post(this.apiUrl, article);
  }

  updateArticle(article: Article): Observable<any> {
    return this.http.put(this.apiUrl, article);
  }

  deleteArticle(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}?id=${id}`);
  }

  getCategories(): Observable<any[]> {
    return this.http.get<any[]>(this.categoriesUrl);
  }
}