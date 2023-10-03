import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-native-modules-practice' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const NativeModulesPractice = NativeModules.NativeModulesPractice
  ? NativeModules.NativeModulesPractice
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return NativeModulesPractice.multiply(a, b);
}

export function plus(a: number, b: number): Promise<number> {
  return NativeModulesPractice.plus(a, b);
}

export function simpleMethodReturns(callback: (data: string) => void) {
  return NativeModulesPractice.simpleMethodReturns(callback);
}

export function simpleMethodWithParams(
  params: string,
  callback: (data: string) => void
) {
  return NativeModulesPractice.simpleMethodWithParams(params, callback);
}

export function simpleMethodWithObj(
  params: Record<string, any>,
  callback: (data: string) => void
) {
  return NativeModulesPractice.simpleMethodWithObj(params, callback);
}

export const someKey = NativeModulesPractice.someKey;
