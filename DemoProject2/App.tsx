/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/react-native-community/react-native-template-typescript
 *
 * @format
 */

import React, { useState } from 'react';
import {
  StyleSheet,
  View,
} from 'react-native';

import { CounterFn } from './components/CounterFn';
import { CounterDisplayFn } from './components/CounterDisplayFn';


const App = () => {
  const [counter1, setCounter1] = useState(101);
  const updateSetCounter = (newCounter: number): void => {
    setCounter1(newCounter);
  };

  return (
    <View style={styles.root}>
      <CounterFn
        label1="label31"
        label2="label41"
        counter1initial={counter1}
        updateFn={updateSetCounter}
      />
      <CounterDisplayFn counter1={counter1}/>
      
    </View>
  );
};

const styles = StyleSheet.create({
  root: {
    flex: 1,
    width: '100%',
    height: '100%'
  }
});

export default App;