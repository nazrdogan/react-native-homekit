import { NativeModules } from 'react-native';

type HomekitType = {
  addHome(homeName: string): Promise<string>;
  removeHome(homeName: string): Promise<string>;
  renameHome(newName: string, oldName: string): Promise<string>;

  addZone(zoneName: string, toHome: string): Promise<string>;
  removeZone(zoneName: string, fromHome: string): Promise<string>;
  renameZone(newName: string, oldName: string, inHome: string): Promise<string>;

  addRoomToHome(name: string, toHome: string): Promise<string>;
  addRoomToZone(name: string, toZone: string, inHome: string): Promise<string>;
  removeRoomFromZone(name: string, fromZone: string, inHome: string): Promise<string>;
  removeRoomFromHome(name: string, fromHome: string): Promise<string>;
  renameRoom(oldName: string, newName: string, inHome: string): Promise<string>;

  addAccessoryToHome(accessoryName: string, toHome: string): Promise<string>;
  removeAccessoryFromHome(accessoryName: string, fromHome: string): Promise<string>;
  assignAccessoryToRoom(accessoryName: string, roomName: string, homeName: string): Promise<Array<string>>;
  renameAccessory(oldName: string, newName: string): Promise<string>;
};

const { Homekit } = NativeModules;

export default Homekit as HomekitType;
