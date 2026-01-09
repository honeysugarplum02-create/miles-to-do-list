import { hello, helloName } from './display.js';
import { sum, subtract, multiply, divide } from './compute.js';

hello();
helloName('Jeremy Miles');

console.log("The sum is", sum(1,2));

console.log("The difference is", subtract(10, 3));

console.log("The product is", multiply(4, 5));

console.log("The qoutient is", divide(10, 2));

