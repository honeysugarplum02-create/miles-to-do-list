export function isMinor(age) {
    return age < 18;
}

export function isAdult(age) {
    return age >= 18 && age < 65;
}

export function isSenior(age) {
    return age >= 65;
}
