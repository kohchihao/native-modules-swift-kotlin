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

export const presentCalendar = async () => {
  return NativeModulesPractice.presentCalendar({
    title: 'WWDC23 Keynote',
    startDate: '2023-10-06T06:45:00.000Z',
    endDate: '2023-10-06T08:45:00.000Z',
    isAllDay: false,
    location: '1 Apple Park Way, Cupertino, CA, United States',
    notes: 'Kick off an exhilarating week of technology and community.',
  });
};

export const checkAndRequestCalendarAccessIfPossible = async () => {
  return NativeModulesPractice.checkAndRequestCalendarAccessIfPossible();
};

export const someKey = NativeModulesPractice.someKey;
