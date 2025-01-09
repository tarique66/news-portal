export interface User {
    id?: number;
    firstName: string;
    lastName: string;
    username: string;
    password?: string;
    confirmPassword?: string;
    email: string;
    role: 'user' | 'admin';
    createdAt?: Date;
}