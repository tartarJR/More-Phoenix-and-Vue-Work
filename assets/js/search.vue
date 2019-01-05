<template>
    
    <div>

        <div class="form-group">
            
            <input type="text" class="form-control" id="address" v-model="address">

            <span class="input-group-btn">
                <button class="btn btn-primary" id="find_lots" v-on:click="findLots">Find Lots</button>
            </span>

        </div>
        
        <table class="table" v-if="!isHidden">
            <thead>
            <tr>
                <th>Street Address</th>
                <th>Price Per Hour</th>
                <th>Free Lots</th>
                <th>Distance</th>
            </tr>
            </thead>
            <tbody id="bids">
                <tr v-for="lot in orderedLots" :key="lot.id">
                    <td>{{ lot.street_address }}</td>
                    <td>{{ lot.price_per_hour }}</td>
                    <td>{{ lot.free_lots }}</td>
                    <td>{{ lot.distance }}</td>
                </tr>
            </tbody>
        </table>

    </div>

</template>

<script>

import axios from "axios";
import _ from 'lodash';

export default {

    data: function() {

      return {
        
        address: "",
        
        lots: [],
        
        lotAddresses: [],

        isHidden: true

      }

    },

    mounted: function() {
    
        this.setMapsAutoComplete();
        this.getLots();

    },

    methods: {
      
        setMapsAutoComplete: function() {

            var autocomplete = new google.maps.places.Autocomplete(
                document.getElementById('address'), 
                { types: ['geocode'] }
            );

            google.maps.event.addListener(autocomplete, 'place_changed', () => {
                let place = autocomplete.getPlace();
                this.address = place.formatted_address;
            });

        },

        getLots: function() {

            axios.get("/api/lots")
                .then(response => {
                    
                    this.lots = response.data.lots

                    for(var i = 0; i < this.lots.length; i++) {
                        
                        var lot = this.lots[i];
                        this.lotAddresses.push(lot.street_address);

                        console.log(lot.street_address);
                    }
                    
                }).catch(error => {
                    console.log(error);
                });

        },

        findLots: function() {
            
            let service = new google.maps.DistanceMatrixService();

            service.getDistanceMatrix({
                origins: [this.address],
                destinations: this.lotAddresses,
                travelMode: 'DRIVING',
                unitSystem: google.maps.UnitSystem.METRIC,
                avoidHighways: false,
                avoidTolls: false
            }, this.buildResponseFor(this.lots));

            this.isHidden = false;
        },

        buildResponseFor: function(lots)  {
            return function (response, status) {
                if (status === 'OK') {

                    var elements = response.rows[0].elements;

                    for(var i = 0; i < elements.length; i++) {
                        var element = elements[i];

                        if(element.status !== 'NOT_FOUND') {
                            lots[i].distance = element.distance.text
                        } else {
                            lots[i].distance = 'N/A'
                        }
                    }
                } else {
                    alert("Unable to find the distance via road.");
                }
            }
        }

    },

    computed: { 

        orderedLots: function () {

            return _.orderBy(this.lots, 'distance')

        }

    }
}

</script>