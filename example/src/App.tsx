import * as React from 'react';

import { Button, StyleSheet, Text, View } from 'react-native';
import {
  multiply,
  simpleMethodReturns,
  simpleMethodWithObj,
  simpleMethodWithParams,
  someKey,
} from 'react-native-native-modules-practice';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    multiply(3, 7).then(setResult);
  }, []);

  const nativeSimpleMethodReturns = () => {
    simpleMethodReturns((data) => {
      console.log(data);
    });
  };

  const nativeSimpleMethodWithParams = () => {
    simpleMethodWithParams('hello world', (data) => {
      console.log(data);
    });
  };

  const nativeSimpleMethodWithObj = () => {
    simpleMethodWithObj({ id: 1, hello: false, bool: true }, (data) => {
      console.log(data);
    });
  };

  return (
    <View style={styles.container}>
      <Text>
        Result: {result} {someKey}
      </Text>
      <Button title="simple return" onPress={nativeSimpleMethodReturns} />
      <Button
        title="simple return with params"
        onPress={nativeSimpleMethodWithParams}
      />
      <Button
        title="simple return with obj"
        onPress={nativeSimpleMethodWithObj}
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
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
