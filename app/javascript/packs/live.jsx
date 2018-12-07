import React from 'react';
import ReactDOM from 'react-dom';
import {hashHistory, IndexRoute} from "react-router";

import ApolloClient from "apollo-boost";
import {ApolloProvider} from 'react-apollo';

import RegionalMap from './../src/components/RegionalMap'

// dataIdFromObject: o => o.id,

const client = new ApolloClient({
    uri: "/api/graphql"
});


const Root = () => {
    return (
        <ApolloProvider client={client}>
            <RegionalMap/>
            {/*<Router history={hashHistory}>*/}

            {/*<Route path="/" component={App}>*/}
            {/*<IndexRoute component={SongList}/>*/}
            {/*<Route path="songs/new" component={SongCreate}/>*/}
            {/*<Route path="songs/:id" component={SongDetail}/>*/}
            {/*</Route>*/}

            {/*</Router>*/}

        </ApolloProvider>
    )
};

ReactDOM.render(
    <Root/>, document.querySelector('#root')
);


