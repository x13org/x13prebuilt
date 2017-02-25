## Pre-built binaries of [X-13ARIMA-SEATS](https://www.census.gov/srd/www/x13as/)

[X-13ARIMA-SEATS](https://www.census.gov/srd/www/x13as/) is provided by the
US Census is both source and prebuild forms.

In order to allow for a streamlined 'zero buttons to press' installation for
[R](http://www.r-project.org) users, we created this repository to provide
_prebuilt_ versions in _standardized_ and hence scriptable locations. The
corresponding [x13binary](https://github.com/x13org/x13binary) package
already uses these.  During its installation, it copies the binary version
corresponding to the operating system it is used on into a
fixed-within-the-package location.

Consequently, other packages such as the R interface to X-13ARIMA-SEATS
[seasonal](https://github.com/christophsax/seasonal) (also see [demo website](http://www.seasonal.website/))
can now depend on [x13binary](https://github.com/x13org/x13binary) and assume
a working binary they can simply deploy directly.

We are of course also offering this repository to other software projects
with wrappers for [X-13ARIMA-SEATS](https://www.census.gov/srd/www/x13as/),
and hope that is useful to them too in order to provide their users with easy
to deploy binary of [X-13ARIMA-SEATS](https://www.census.gov/srd/www/x13as/).

### Status

The repository is operational for Windows, OS X (Darwin) and Linux (via using
statically linked binaries).

### Directory Layout

The directories `linux`, `osx` and `windows` are from our initial build round
and correspond to version 1.1.b19.  The directory `v1.1.26` is from the
second build round. It now uses a clearly versioned top-level directory name,
and contains the per-architecture directories within,

### License Information and Disclaimer

As stated on the [X-13ARIMA-SEATS site](https://www.census.gov/srd/www/x13as/) 
(March 1, 2016):

> This Software was created by U.S. Government employees and therefore is not
> subject to copyright in the United States (17 U.S.C. §105). The United
> States/U.S. Department of Commerce (“Commerce”) reserve all rights to seek and
> obtain copyright protection in countries other than the United States. The
> United States/Commerce hereby grant to User a royalty-free, nonexclusive
> license to use, copy, and create derivative works of the Software outside of
> the United States.

> The Software is provided to the User and those who may take by, through or
> under it, “as is,” without any warranty (whether express or implied) or
> representation whatsoever, including but not limited to any warranty of
> merchantability. The Software is taken hereunder without any right to support
> or to any improvements, extensions, or modifications, except as may be agreed
> to separately, in writing, by Commerce.

> User, on behalf of itself and all others who take by, through or under it,
> hereby and forever waives, releases, and discharges the United States/Commerce
> and all its instrumentalities from any and all liabilities and obligations in
> connection with the use, application, sale or conveyance of the Software. User
> shall indemnify and hold harmless the United States/Commerce and its
> instrumentalities from all claims, liabilities, demands, damages, expenses,
> and losses arising from or in connection with User's use, application, sale or
> conveyance of the Software, including those who take by, through or under User
> whether or not User was directly involved. This provision will survive
> termination of this Agreement and will include any and all claims or
> liabilities arising under intellectual property rights, such as patents,
> copyrights, trademarks, and trade secrets. If User of software is an Executive
> Agency of the United States, this clause is not applicable.

> The construction, validity, performance, and effect of this Agreement for all
> purposes will be governed by Federal law of the United States.

> User agrees to make a good faith effort to use the Software in a way that does
> not cause damage, harm, or embarrassment to the United States/Commerce. The
> United States/Commerce expressly reserve all rights and remedies.

### Authors

This [x13prebuild](https://github.com/x13org/x13prebuilt) repository was
created by Dirk Eddelbuettel, and is maintained by Dirk Eddelbuettel
and Christoph Sax.

We consider this repository to be open and welcome suggestion (via issue
tickets) and pull requests,

