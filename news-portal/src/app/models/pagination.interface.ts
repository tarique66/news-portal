export interface PaginationParams {
    page: number;
    limit: number;
    search?: string;
    categoryId?: number;
    startDate?: Date;
    endDate?: Date;
}

export interface PaginatedResponse<T> {
    items: T[];
    total: number;
    page: number;
    limit: number;
    totalPages: number;
}