export interface Article {
    id: number;
    title: string;
    content: string;
    author_id: number;
    category_id: number;
    category_name: string; 
    image_url: string;
    publish_date: Date;
    created_at: Date;
    updated_at: Date;
  }