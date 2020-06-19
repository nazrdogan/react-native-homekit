import { NativeModules } from 'react-native';

type HomekitType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Homekit } = NativeModules;

export default Homekit as HomekitType;
