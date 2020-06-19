import { NativeModules } from 'react-native';

type HomekitType = {
  addHome(homeName: string): Promise<string>;
  removeHome(homeName: string): Promise<string>;
};

const { Homekit } = NativeModules;

export default Homekit as HomekitType;
