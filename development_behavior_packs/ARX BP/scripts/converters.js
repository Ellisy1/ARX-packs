// There are functions to convert values

export function str2obj(str) {
    return JSON.parse(str)
}

export function obj2str(obj) {
    return JSON.stringify(obj)
}