Pure ruby independent ID generator like the SnowFlake
=====================================================

This is ID generator like the SnowFlake that implemented by pure ruby.

Installation
------------

Add this line to your application's Gemfile:

    gem "chiliflake"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chiliflake


QuickStart
----------

**Genenate ID:**

```
generator_id = 1
i = ChiliFlake.new(generator_id)
i.generate
=> 522167874144443932
```

**Parse for the Flaked ID:**

```
ChiliFlake.parse(522167874144443932)
=> {:sequence=>3612, :generator_id=>1, :ts_w_millis=>124494522606}
```

**Get time in the Flaked ID:**

```
ChiliFlake.parse(522167874144443932)
=> 2014-10-15 08:31:37 +0900
```


Overview
--------

ID structure

```
 upper bit(always 0)      1 bit
 offseted timestamp      41 bits
 generator id            10 bits
 sequence per generator  12 bits
```

Value assinged:

```
generator id assigned by administrator.
sequence is cyclic in an instance.
```

Max value(= limited):

```
 > ChiliFlake.parse((1<<63) - 1)
 => {:sequence=>4095, :generator_id=>1023, :ts_w_millis=>2199023255551}
 > ChiliFlake.time((1<<63) - 1)
 => 2080-07-11 02:30:30 +0900
```

Notice:

1. Duplicate when generate the ID of 4096 or more per generator within 1ms.  
   => Workaround: Unique check in the user side. (e.g. DB Pkey, unique index...)

see https://github.com/twitter/snowflake


Contributing
------------

1. Fork it ( https://github.com/[my-github-username]/pretty_hash/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

EoT

