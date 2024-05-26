const isLocal = false;

const LOCAL_API_URL = 'http://localhost:8000';
const PROD_API_URL = 'https://acwatts.in:8000';

export const API_URL = isLocal ? LOCAL_API_URL : PROD_API_URL;