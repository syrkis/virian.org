export interface Opus {
    author: string;
    title: string;
    date: string;
    body: string;
    slug: string;
    description: string;
    image: string;
    type: string;
    category: string;
    keywords: string[];
    published: boolean;
}

export interface Librum {
    title: string;
    author: string;
    date: string;
    body: string;
    image: string;
    category: string;
    link: string;
    price: string;
}
