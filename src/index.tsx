import { NativeModules } from 'react-native';

type HomekitType = {
  addHome(homeName: string): Promise<string>;
  removeHome(homeName: string): Promise<string>;
  renameHome(newName: string, oldName: string): Promise<string>;

  addZone(zoneName: string, toHome: string): Promise<string>;
  removeZone(zoneName: string, fromHome: string): Promise<string>;
  renameZone(newName: string, oldName: string, inHome: string): Promise<string>;
};

const { Homekit } = NativeModules;

export default Homekit as HomekitType;
