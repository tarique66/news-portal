import { Component, OnInit } from '@angular/core';
import { ArticleService } from '../services/news.service'; 
import { Article } from '../models/news.interface';
import { CommonModule } from '@angular/common'; 

@Component({
  selector: 'app-news-list',
  templateUrl: './news-list.component.html',
  styleUrls: ['./news-list.component.css'],
  imports: [CommonModule]
})
export class NewsListComponent implements OnInit {
  articles: Article[] = [];
  filteredArticles: Article[] = [];
  categories: any[] = [];
  searchTerm: string = '';
  selectedCategory: number | null = null;
  currentDate = new Date().toISOString().split('T')[0];
  selectedDate: string = '';

  constructor(private articleService: ArticleService) {}

  ngOnInit(): void {
    this.articleService.getArticles().subscribe((data: Article[]) => {
      this.articles = data;
      this.filteredArticles = data; 
      console.log('Fetched Articles:', this.articles);
    }, error => {
      console.error('Error loading articles:', error);
    });

    this.articleService.getCategories().subscribe((data: any[]) => {
      this.categories = data;
      console.log('Fetched Categories:', this.categories);
    }, error => {
      console.error('Error loading categories:', error);
    });
  }

  filterByCategory(categoryId: number | null): void {
    this.selectedCategory = categoryId;
    console.log('Selected Category:', this.selectedCategory);
    this.applyFilters();
  }

  filterByDate(event: Event): void {
    const target = event.target as HTMLInputElement;
    this.selectedDate = target.value;
    console.log('Selected date:', this.selectedDate);
    this.applyFilters();
  }

  applyFilters(): void {
    console.log('Applying filters. Category:', this.selectedCategory, 'Search Term:', this.searchTerm);
    this.filteredArticles = this.articles;

    if (this.selectedCategory !== null) {
      this.filteredArticles = this.filteredArticles.filter(article => {
        const matchesCategory = Number(article.category_id) === Number(this.selectedCategory);
        console.log('Article:', article, 'Category ID:', article.category_id, 'Selected Category:', this.selectedCategory, 'Matches Category:', matchesCategory);
        return matchesCategory;
      });
    }

    if (this.searchTerm) {
      this.filteredArticles = this.filteredArticles.filter(article => {
        const matchesSearch = article.title.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
                              article.content.toLowerCase().includes(this.searchTerm.toLowerCase());
        console.log('Article:', article, 'Matches Search:', matchesSearch);
        return matchesSearch;
      });
    }

    if (this.selectedDate) {
      this.filteredArticles = this.filteredArticles.filter(article => {
        const articleDate = new Date(article.publish_date).toISOString().split('T')[0];
        return articleDate === this.selectedDate;
      });
    }

    console.log('Filtered Articles:', this.filteredArticles);
  }

  onSearchChange(event: Event): void {
    const target = event.target as HTMLInputElement;
    this.searchTerm = target.value;
    console.log('Search term changed:', this.searchTerm);
    this.applyFilters();
  }

  getCategoryName(categoryId: number): string {
    const category = this.categories.find(cat => cat.id === categoryId);
    return category ? category.name : 'Unknown';
  }
}