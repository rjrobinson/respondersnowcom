import ApolloClient from 'apollo-boost';
import React, {Component} from 'react'
import ReactDOM from 'react-dom';
// import { ApolloClient } from 'apollo-client';
import {HttpLink} from 'apollo-link-http';
import {InMemoryCache} from 'apollo-cache-inmemory';

// import {Provider} from 'react-redux'

const RESPONDERSNOW_BASE_URL = '/api/graphql';

const httpLink = new HttpLink({
    uri: RESPONDERSNOW_BASE_URL
});

const TITLE = 'RespondersNOW Graphql'
const cache = new InMemoryCache();

const client = new ApolloClient({
    link: httpLink,
    cache,
});



class LiveMap extends Component {
    render() {
        return (
            <div>
                <h3>{TITLE}</h3>
            </div>
        )
    }
}


export {LiveMap}

ReactDOM.render(< LiveMap/>, document.querySelector('#live-map'))

