import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure IncompressibleViscousFlowPackage where
  velocityField : fluidDomain → Vector ℝ 3
  pressureField : fluidDomain → ℝ
  density : ℝ
  viscosity : ℝ
  continuityEquation : Prop
  momentumEquation : Prop
  stressTensor : Prop
  evidencePackage : IncompressibleViscousFlowEvidence

structure IncompressibleViscousFlowEvidence where
  continuityHolds : ∇·velocityField = 0
  momentumHolds : ρ (∂v/∂t + v·∇v) = -∇p + μ ∇²v + f
  stressTensorDefined : stressTensor = -p I + μ (∇v + (∇v)ᵀ)
  densityPositive : density > 0
  viscosityNonnegative : viscosity ≥ 0

def IncompressibleViscousFlowClosed (F : IncompressibleViscousFlowPackage) : Prop :=
  F.continuityEquation ∧ F.momentumEquation ∧ F.stressTensor

theorem incompressible_viscous_flow_closed_from_evidence
    (F : IncompressibleViscousFlowPackage) (E : F.evidencePackage) :
    IncompressibleViscousFlowClosed F := by
  exact And.intro E.continuityHolds
    (And.intro E.momentumHolds E.stressTensorDefined)

end HautevilleHouse.CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean