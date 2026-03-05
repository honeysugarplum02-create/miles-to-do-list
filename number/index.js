import { isMinor, isAdult, isSenior } from './ageChecker.js';
import {
    isNegative,
    isZero,
    isPositive,
    isOdd,
    isEven
} from './numberChecker.js';

const num = 65;

console.log(`Is Minor: ${isMinor(num)}`);
console.log(`Is Adult: ${isAdult(num)}`);
console.log(`Is Senior: ${isSenior(num)}`);
console.log(`Is Negative: ${isNegative(num)}`);
console.log(`Is Zero: ${isZero(num)}`);
console.log(`Is Positive: ${isPositive(num)}`);
console.log(`Is Odd: ${isOdd(num)}`);
console.log(`Is Even: ${isEven(num)}`);