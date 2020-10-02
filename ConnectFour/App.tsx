import 'react-native-gesture-handler';
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { StackParams } from './src/types/navigation';
import { ConnectFoor } from './src/screens/ConnectFoor';
import { StyleSheet } from 'react-native';

const Stack = createStackNavigator<StackParams>();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="ConnectFoor" component={ConnectFoor} options={{headerTitleStyle: {
          fontFamily: "Abel-Regular"
        }}}/>
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
