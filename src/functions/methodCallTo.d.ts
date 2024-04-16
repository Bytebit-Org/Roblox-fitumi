import { CallMatchOptions } from "../classes/CallMatchOptions";

export type methodCallTo = <T extends Callback>(method: T, ...args: Parameters<T>) => CallMatchOptions<T>;
