import * as React from 'react';
import { StyleSheet, View, Button, NativeEventEmitter, NativeModules } from 'react-native';
import HomeKit from 'react-native-homekit';

export default function App() {
  const addHome = () => {
    HomeKit.addHome("Nazir's Home").then((result) => {
      console.log(result)
    });
  }
  const startSearchingForNewAccessories = () => {
    HomeKit.startSearchingForNewAccessories()
    const myModuleEvt = new NativeEventEmitter(NativeModules.Homekit)
    var subscription = myModuleEvt.addListener('didFindNewAccessory', (accessory) => {
      console.log(accessory)
    }
    );
    subscription.remove();
  }
  const removeHome = () => {
    HomeKit.removeHome("Nazir's Home").then((result) => {
      console.log(result)
    });
  }
  const renameHome = () => {
    HomeKit.renameHome("Berkay's Home", "Nazir's Home").then((result) => {
      console.log(result)
    });
  }
  return (
    <View style={styles.container}>
      <Button
        onPress={addHome}
        title="Add Home"
        color="blue"
      />
      <Button
        onPress={removeHome}
        title=" Remove Home"
        color="#841584"
      />
      <Button
        onPress={renameHome}
        title="Rename Home"
        color="green"
      />
      <Button
        onPress={startSearchingForNewAccessories}
        title="Start Searching For New Accessories"
        color="orange"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
