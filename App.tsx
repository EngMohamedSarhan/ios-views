/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/react-native-community/react-native-template-typescript
 *
 * @format
 */
import {NavigationContainer, NavigationProp} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import React, {FC} from 'react';
import {
  Button,
  HostComponent,
  requireNativeComponent,
  SafeAreaView,
  StyleSheet,
  View,
  ViewProps,
} from 'react-native';

interface INavigationProp {
  navigation: NavigationProp<any>;
}

const Stack = createNativeStackNavigator();

const WarView = requireNativeComponent('WarView') as HostComponent<ViewProps>;

const SlotsView = requireNativeComponent(
  'SlotsView',
) as HostComponent<ViewProps>;

const App = () => (
  <NavigationContainer>
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="War" component={WarScreen} />
      <Stack.Screen name="Slots" component={SlotsScreen} />
    </Stack.Navigator>
  </NavigationContainer>
);

const WarScreen = () => (
  <View>
    <WarView style={styles.nativeScreen} />
  </View>
);

const SlotsScreen = () => (
  <View>
    <SlotsView style={styles.nativeScreen} />
  </View>
);

const HomeScreen: FC<INavigationProp> = ({navigation: {navigate}}) => (
  <SafeAreaView>
    <Button title="War" onPress={() => navigate('War')} />
    <Button title="Slots" onPress={() => navigate('Slots')} />
  </SafeAreaView>
);

const styles = StyleSheet.create({
  nativeScreen: {
    width: '100%',
    height: '100%',
  },
});

export default App;
