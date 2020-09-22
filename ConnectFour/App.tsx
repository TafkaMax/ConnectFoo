import 'react-native-gesture-handler';
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';
<<<<<<< HEAD
import { GameBoard } from './src/components/GameBoard';
import { GameStatistics } from './src/components/GameStatistics';
import { StackParams } from './src/types/navigation';
import { HomeScreen } from './src/screens/HomeScreen';

const Stack = createStackNavigator<StackParams>();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={HomeScreen} />
      </Stack.Navigator>
    </NavigationContainer>
=======
import { GameBoard } from './components/GameBoard';
import { GameStatistics } from './components/GameStatistics';

declare const global: {HermesInternal: null | {}};

const App = () => {
  return (
    <View style={styles.root}>
        <GameStatistics/>
        <GameBoard/>
    </View>
>>>>>>> 751521786aa8eadea565d0650e95eabcd57e081b
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
