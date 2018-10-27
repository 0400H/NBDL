/* Copyright (c) 2016 NoobsDNN Authors All Rights Reserve.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. */

#ifndef NBDNN_ICESWORD_FUNCS_IMPL_X86_ICESWORD_SCALE_H
#define NBDNN_ICESWORD_FUNCS_IMPL_X86_ICESWORD_SCALE_H

#include "icesword/funcs/impl/x86/x86_common.h"

#include "icesword/funcs/impl/impl_scale.h"
// #include "icesword/funcs/impl/impl_base.h"


namespace noobsdnn {
namespace icesword {

template <DataType OpDtype,
        DataType inDtype,
        DataType outDtype,
        typename LayOutType_op,
        typename LayOutType_in,
        typename LayOutType_out>
class SaberScale<X86, OpDtype, inDtype, outDtype,
        LayOutType_op, LayOutType_in, LayOutType_out> : public ImplBase<
        Tensor<X86, inDtype, LayOutType_in>,
        Tensor<X86, outDtype, LayOutType_out>,
        Tensor<X86, OpDtype, LayOutType_op>,
        ScaleParam<Tensor<X86, OpDtype, LayOutType_op> > >
{
public:
    typedef Tensor<X86, inDtype, LayOutType_in> DataTensor_in;
    typedef Tensor<X86, outDtype, LayOutType_out> DataTensor_out;
    typedef Tensor<X86, OpDtype, LayOutType_op> OpTensor;

    SaberScale()
    {}

    ~SaberScale() {
    }

    virtual SaberStatus init(const std::vector<DataTensor_in*>& inputs,
                             std::vector<DataTensor_out*>& outputs,
                             ScaleParam<OpTensor> &param,
                             Context<X86> &ctx) override;

    virtual SaberStatus create(const std::vector<DataTensor_in*>& inputs,
                               std::vector<DataTensor_out*>& outputs,
                               ScaleParam<OpTensor> &param,
                               Context<X86> &ctx) override;

    virtual SaberStatus dispatch(const std::vector<DataTensor_in*>& inputs,
                                 std::vector<DataTensor_out*>& outputs,
                                 ScaleParam<OpTensor> &param) override;

private:

};

}
}
#endif
