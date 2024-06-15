import * as React from 'react';

import { Alert, StyleSheet, View } from 'react-native';
import { FabricDeclarativeView } from 'react-native-fabric-declarative';

export default function App() {
  return (
    <View style={styles.container}>
      <FabricDeclarativeView
        style={styles.box}
        title="Fill the form"
        options={[3.1415, 2.7182, 1.618, 186.282]}
        onSubmit={({ nativeEvent }) => {
          const title = 'Result';
          const message = JSON.stringify(nativeEvent);
          Alert.alert(title, message);
        }}
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
  box: {
    width: '100%',
    height: '100%',
    marginVertical: 20,
  },
});
