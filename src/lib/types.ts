export interface Post {
    authors: Author[];
    title: string;
    date: string;
    body: string;
    slug: string;
    description: string;
    author: string;
    illustration: string;
    type: string;
    category: string;
}

export interface Author {
    name: string;
    email: string;
    institution: string;
}